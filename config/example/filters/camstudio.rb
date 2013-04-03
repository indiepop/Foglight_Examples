class CamStudio

  require 'Win32API'
  require 'timeout'

  # Click the rec button
  MOUSEEVENTF_LEFTDOWN = 0x0002
  MOUSEEVENTF_LEFTUP   = 0x0004
  SW_RESTORE           = 9

  @@find_window           = Win32API.new 'user32', 'FindWindow', ['P' , 'P' ], 'L'
  @@set_foreground_window = Win32API.new 'user32', 'SetForegroundWindow', ['P'], 'L'
  @@get_window_rect       = Win32API.new 'user32', 'GetWindowRect', ['L' , 'P' ], 'I'
  @@set_cursor_pos        = Win32API.new 'user32', 'SetCursorPos', ['L' , 'L' ], 'I'
  @@mouse_event           = Win32API.new 'user32', 'mouse_event', ['L' , 'L' , 'L' , 'L' , 'L' ], 'V'
  @@show_window           = Win32API.new 'user32', 'ShowWindow', ['P', 'P']

  #
  # name: the name of the CamStudio
  #
  def initialize name = 'CamStudio - Custom Build'
    sleep 0.2 while (@h_cam = @@find_window.call nil, name ) <= 0
    set_window_pos

    # TODO: raise exception if can not find
  end

  def record
    mouse_click 22, 64
  end

  def stop
    mouse_click 78, 64
  end

private

  def set_foreground
    @@show_window.call @h_cam, SW_RESTORE
    @@set_foreground_window.call @h_cam
    sleep 1
  end

  def move_cursor left = 0, top = 0
    set_window_pos
    point = [@left + left, @top + top]

    @@set_cursor_pos.call *point
  end

  def set_window_pos
    rectangle = [0, 0, 0, 0].pack 'L*'

    @@get_window_rect.call @h_cam, rectangle
    puts rectangle
    @left, @top, @right, @bottom = rectangle.unpack 'L*'
  end

  # point: the offset
  def mouse_click left = 0, top = 0
    set_foreground

    move_cursor left, top

    @@mouse_event.call MOUSEEVENTF_LEFTDOWN, 0, 0, 0, 0
    @@mouse_event.call MOUSEEVENTF_LEFTUP, 0, 0, 0, 0
  end
end