PROJECT_DIR := $(shell pwd)
CC ?= ../../buildroot/output/rockchip_rk3128_game/host/bin/arm-buildroot-linux-gnueabihf-gcc
BIN = game

STAGING_DIR ?= ../../buildroot/output/rockchip_rk3128_game/staging/

OBJ = audioplay_dialog.o \
      browser_dialog.o \
      desktop_dialog.o \
      ffplay_ipc.o \
      hardware.o \
      lowpower_dialog.o \
      main.o \
      message_dialog.o \
      parameter.o \
      pic_preview_dialog.o \
      setting_backlight_dialog.o \
      setting_dialog.o \
      setting_eq_dialog.o \
      setting_gamedisp_dialog.o \
      setting_language_dialog.o \
      setting_screenoff_dialog.o \
      setting_themestyle_dialog.o \
      setting_version_dialog.o \
      sysfs.o \
      system.o \
      videoplay_hw_dialog.o \
      videoplay_dialog.o \


CFLAGS ?= -I./include \
	  -I$(STAGING_DIR)/usr/include \
          -I$(STAGING_DIR)/usr/include/libdrm \
          -I$(STAGING_DIR)/usr/include \
	  -L$(STAGING_DIR)/usr/lib \
	  -L$(STAGING_DIR)/usr/lib \
	  -lpthread  -ldrm -lminigui_ths -ljpeg -lpng -lm \
	  -lavformat -lavcodec -lswscale -lavutil -lfreetype

$(BIN): $(OBJ)
	$(CC) -o $(BIN) $(OBJ) $(CFLAGS)

%.o: %.c
	$(CC) -c $< -o $@ $(CFLAGS)

clean:
	rm -rf $(OBJ) $(BIN)
