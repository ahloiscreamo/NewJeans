from kitty.fast_data_types import Screen
from kitty.tab_bar import (DrawData, ExtraData, TabBarData, draw_title)

def draw_tab(
    draw_data: DrawData,
    screen: Screen,
    tab: TabBarData,
    before: int,
    max_title_length: int,
    index: int,
    is_last: bool,
    extra_data: ExtraData,
) -> int:
    BG_TRANSPARENT = 0
    BG_TAB = screen.cursor.bg

    screen.cursor.bg = BG_TRANSPARENT
    screen.cursor.fg = BG_TAB
    if index == 1:
        screen.draw(" ")
    screen.draw("")
    screen.cursor.bg = BG_TAB

    draw_title(draw_data, screen, tab, index)

    screen.cursor.bg = BG_TRANSPARENT
    screen.cursor.fg = BG_TAB
    screen.draw("")
    if not is_last:
        screen.draw(" ")
    screen.cursor.bg = BG_TAB

    return screen.cursor.x
