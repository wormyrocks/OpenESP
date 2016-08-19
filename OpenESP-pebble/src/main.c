#include <pebble.h>

#define TIMEOUT_MS 1000
#define MAX_READ_SIZE 100
#define WIDTH 144
#define HEIGHT 168


static Window *s_main_window;
static TextLayer *s_status_layer;
static TextLayer *s_raw_text_layer;
static Layer *s_canvas_layer;
static char s_text_buffer2[20];
static uint8_t lines[WIDTH];
static uint8_t array_ind;
static SmartstrapAttribute *s_raw_attribute;

static void prv_update_text(void) {
	if (smartstrap_service_is_available(SMARTSTRAP_RAW_DATA_SERVICE_ID)) {
		text_layer_set_text(s_status_layer, "Connected!");
	} else {
		text_layer_set_text(s_status_layer, "Connecting...");
	}
}

static void prv_did_read(SmartstrapAttribute *attr, SmartstrapResult result,
						 const uint8_t *data, size_t length) {
	if (attr == s_raw_attribute) {
		APP_LOG(APP_LOG_LEVEL_DEBUG, "did_read(s_raw_attribute, %d, %d)", result, length);
		if (result == SmartstrapResultOk && length == 4) {
			uint16_t to1, ta;

			memcpy(&to1, data, 2);
			memcpy(&ta, data+2, 2);
			// 		snprintf(s_text_buffer2, 20, "%x", temp);
// 			snprintf(s_text_buffer2, 20, "%d", (int)to1 - (int)ta);
// 			text_layer_set_text(s_raw_text_layer, s_text_buffer2);
			if (to1 > ta){
				lines[array_ind] = HEIGHT / 2 - (to1-ta)*0.1;
			}else{
				lines[array_ind] = HEIGHT / 2 + (ta-to1)*0.1;
			}
			array_ind = (array_ind + 1) % WIDTH;
			layer_mark_dirty(s_canvas_layer);
		}
	} else {
		APP_LOG(APP_LOG_LEVEL_ERROR, "did_read(<%p>, %d)", attr, result);
	}
}

static void prv_did_write(SmartstrapAttribute *attr, SmartstrapResult result) {
	if (attr == s_raw_attribute) {
		APP_LOG(APP_LOG_LEVEL_DEBUG, "did_write(s_raw_attribute, %d)", result);
	} else {
		APP_LOG(APP_LOG_LEVEL_ERROR, "did_write(<%p>, %d)", attr, result);
	}
}

static void prv_read_raw(void) {
	if (!smartstrap_service_is_available(smartstrap_attribute_get_service_id(s_raw_attribute))) {
		APP_LOG(APP_LOG_LEVEL_DEBUG, "s_raw_attribute is not available");
		return;
	}
	SmartstrapResult result = smartstrap_attribute_read(s_raw_attribute);
	if (result != SmartstrapResultOk) {
		APP_LOG(APP_LOG_LEVEL_ERROR, "Read of s_raw_attribute failed with result: %d", result);
	}
}

static void prv_availablility_status_changed(SmartstrapServiceId service_id, bool is_available) {
	APP_LOG(APP_LOG_LEVEL_DEBUG, "Availability for 0x%x is %d", service_id, is_available);
	prv_update_text();
}

static void prv_notified(SmartstrapAttribute *attr) {
	if (attr == s_raw_attribute) {
		prv_read_raw();
		APP_LOG(APP_LOG_LEVEL_DEBUG, "notified(s_raw_attribute)");
	} else {
		APP_LOG(APP_LOG_LEVEL_ERROR, "notified(<%p>)", attr);
	}
}

static GColor get_sample_color(uint8_t sample){
	if (sample < HEIGHT / 8){
		return GColorOrange;
	}
	if (sample < HEIGHT / 4){
		return GColorRed;
	}
	if (sample < HEIGHT / 8 * 3){
		return GColorSunsetOrange;
	}
	if (sample < HEIGHT / 2){
		return GColorMelon;
	}
	if (sample < 5 * HEIGHT / 8){
		return GColorCadetBlue;
	}
	if (sample < 3 * HEIGHT / 4){
		return GColorCobaltBlue;
	}
	if (sample < 7 * HEIGHT / 8){
		return GColorBlue;
	}else{
		return GColorDukeBlue;
	}
}

static void update_canvas(Layer *layer, GContext *ctx){

	for (int i = 0; i < WIDTH; ++i){
		uint8_t sample = lines[(array_ind + i)%WIDTH];
		graphics_context_set_stroke_color(ctx,get_sample_color(sample));
		graphics_draw_line(ctx, GPoint(i,HEIGHT/2), GPoint(i,sample));
	}
}

static void prv_main_window_load(Window *window) {
	GRect bounds = layer_get_bounds(window_get_root_layer(window));
	s_canvas_layer = layer_create(bounds);
	layer_set_update_proc(s_canvas_layer, update_canvas);
	layer_add_child(window_get_root_layer(window), s_canvas_layer);
// 	text_layer_set_font(s_status_layer, fonts_get_system_font(FONT_KEY_GOTHIC_28));
// 	prv_update_text();
// 	text_layer_set_text_color(s_status_layer, GColorBlack);
// 	text_layer_set_background_color(s_status_layer, GColorClear);
// 	text_layer_set_text_alignment(s_status_layer, GTextAlignmentCenter);
// 	text_layer_set_overflow_mode(s_status_layer, GTextOverflowModeWordWrap);
// 	layer_add_child(window_get_root_layer(window), text_layer_get_layer(s_status_layer));

// 	s_raw_text_layer = text_layer_create(GRect(0, 100, 144, 40));
// 	text_layer_set_font(s_raw_text_layer, fonts_get_system_font(FONT_KEY_GOTHIC_28));
// 	text_layer_set_text(s_raw_text_layer, "-");
// 	text_layer_set_text_color(s_raw_text_layer, GColorBlack);
// 	text_layer_set_background_color(s_raw_text_layer, GColorClear);
// 	text_layer_set_text_alignment(s_raw_text_layer, GTextAlignmentCenter);
// 	text_layer_set_overflow_mode(s_raw_text_layer, GTextOverflowModeWordWrap);
// 	layer_add_child(window_get_root_layer(window), text_layer_get_layer(s_raw_text_layer));
}

static void prv_main_window_unload(Window *window) {
	text_layer_destroy(s_status_layer);
}

static void prv_init(void) {
	s_main_window = window_create();
	static const int d = HEIGHT/2;
	for (int i = 0; i < WIDTH; ++i){
		lines[i] = d;
	}
	array_ind = 0;
	window_set_window_handlers(s_main_window, (WindowHandlers) {
		.load = prv_main_window_load,
		.unload = prv_main_window_unload
	});
	window_stack_push(s_main_window, true);
	SmartstrapHandlers handlers = (SmartstrapHandlers) {
		.availability_did_change = prv_availablility_status_changed,
		.did_write = prv_did_write,
		.did_read = prv_did_read,
		.notified = prv_notified
	};
	smartstrap_subscribe(handlers);
	smartstrap_set_timeout(50);
	s_raw_attribute = smartstrap_attribute_create(0, 0, 64);
}

static void prv_deinit(void) {
	window_destroy(s_main_window);
	smartstrap_unsubscribe();
}

int main(void) {
	prv_init();
	APP_LOG(APP_LOG_LEVEL_DEBUG, "STARTING APP");
	if (s_raw_attribute) {
		app_event_loop();
	}
	APP_LOG(APP_LOG_LEVEL_DEBUG, "ENDING APP");
	prv_deinit();
}