/* UI Icons - Common user interface icons */
module UIIcons {
  const DASHBOARD =
    "<rect x='3' y='3' width='7' height='7'/><rect x='14' y='3' width='7' height='7'/><rect x='14' y='14' width='7' height='7'/><rect x='3' y='14' width='7' height='7'/>"

  const GRID =
    "<rect x='3' y='3' width='7' height='7'/><rect x='14' y='3' width='7' height='7'/><rect x='14' y='14' width='7' height='7'/><rect x='3' y='14' width='7' height='7'/>"

  const LIST =
    "<line x1='8' y1='6' x2='21' y2='6'/><line x1='8' y1='12' x2='21' y2='12'/><line x1='8' y1='18' x2='21' y2='18'/><line x1='3' y1='6' x2='3.01' y2='6'/><line x1='3' y1='12' x2='3.01' y2='12'/><line x1='3' y1='18' x2='3.01' y2='18'/>"

  const LAYOUT =
    "<rect x='3' y='3' width='18' height='18' rx='2' ry='2'/><line x1='3' y1='9' x2='21' y2='9'/><line x1='9' y1='21' x2='9' y2='9'/>"

  const SIDEBAR =
    "<rect x='3' y='3' width='18' height='18' rx='2' ry='2'/><line x1='9' y1='3' x2='9' y2='21'/>"

  const COLUMNS =
    "<rect x='3' y='3' width='18' height='18' rx='2' ry='2'/><line x1='12' y1='3' x2='12' y2='21'/>"

  const ROWS =
    "<rect x='3' y='3' width='18' height='18' rx='2' ry='2'/><line x1='3' y1='12' x2='21' y2='12'/>"

  const MAXIMIZE_2 =
    "<polyline points='15 3 21 3 21 9'/><polyline points='9 21 3 21 3 15'/><line x1='21' y1='3' x2='14' y2='10'/><line x1='3' y1='21' x2='10' y2='14'/>"

  const MINIMIZE_2 =
    "<polyline points='4 14 10 14 10 20'/><polyline points='20 10 14 10 14 4'/><line x1='14' y1='10' x2='21' y2='3'/><line x1='3' y1='21' x2='10' y2='14'/>"

  const MOVE =
    "<polyline points='5 9 2 12 5 15'/><polyline points='9 5 12 2 15 5'/><polyline points='15 19 12 22 9 19'/><polyline points='19 9 22 12 19 15'/><line x1='2' y1='12' x2='22' y2='12'/><line x1='12' y1='2' x2='12' y2='22'/>"

  const DRAG =
    "<circle cx='9' cy='5' r='1'/><circle cx='9' cy='12' r='1'/><circle cx='9' cy='19' r='1'/><circle cx='15' cy='5' r='1'/><circle cx='15' cy='12' r='1'/><circle cx='15' cy='19' r='1'/>"

  const MORE_VERTICAL =
    "<circle cx='12' cy='12' r='1'/><circle cx='12' cy='5' r='1'/><circle cx='12' cy='19' r='1'/>"

  const MORE_HORIZONTAL =
    "<circle cx='12' cy='12' r='1'/><circle cx='19' cy='12' r='1'/><circle cx='5' cy='12' r='1'/>"

  const SLIDERS =
    "<line x1='4' y1='21' x2='4' y2='14'/><line x1='4' y1='10' x2='4' y2='3'/><line x1='12' y1='21' x2='12' y2='12'/><line x1='12' y1='8' x2='12' y2='3'/><line x1='20' y1='21' x2='20' y2='16'/><line x1='20' y1='12' x2='20' y2='3'/><line x1='1' y1='14' x2='7' y2='14'/><line x1='9' y1='8' x2='15' y2='8'/><line x1='17' y1='16' x2='23' y2='16'/>"

  const TOGGLE_LEFT =
    "<rect x='1' y='5' width='22' height='14' rx='7' ry='7'/><circle cx='8' cy='12' r='3'/>"

  const TOGGLE_RIGHT =
    "<rect x='1' y='5' width='22' height='14' rx='7' ry='7'/><circle cx='16' cy='12' r='3'/>"

  const BATTERY =
    "<rect x='1' y='6' width='18' height='12' rx='2' ry='2'/><line x1='23' y1='13' x2='23' y2='11'/>"

  const BATTERY_CHARGING =
    "<path d='M5 18H3a2 2 0 0 1-2-2V8a2 2 0 0 1 2-2h3.19M15 6h2a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2h-3.19'/><line x1='23' y1='13' x2='23' y2='11'/><polyline points='11 6 7 12 13 12 9 18'/>"

  const BATTERY_FULL =
    "<rect x='1' y='6' width='18' height='12' rx='2' ry='2'/><line x1='23' y1='13' x2='23' y2='11'/><rect x='3' y='8' width='14' height='8' fill='currentColor'/>"

  const BATTERY_HALF =
    "<rect x='1' y='6' width='18' height='12' rx='2' ry='2'/><line x1='23' y1='13' x2='23' y2='11'/><rect x='3' y='9' width='4' height='6'/><rect x='8' y='9' width='4' height='6'/><rect x='13' y='9' width='4' height='6' opacity='0.3'/>"

  const WIFI_OFF =
    "<line x1='1' y1='1' x2='23' y2='23'/><path d='M16.72 11.06A10.94 10.94 0 0 1 19 12.55'/><path d='M5 12.55a10.94 10.94 0 0 1 5.17-2.39'/><path d='M10.71 5.05A16 16 0 0 1 22.58 9'/><path d='M1.42 9a15.91 15.91 0 0 1 4.7-2.88'/><path d='M8.53 16.11a6 6 0 0 1 6.95 0'/><line x1='12' y1='20' x2='12.01' y2='20'/>"

  const SIGNAL = "<path d='M2 20h.01M7 20v-4M12 20v-8M17 20V8M22 4v16'/>"

  const BATTERY_LOW =
    "<rect x='1' y='6' width='18' height='12' rx='2' ry='2'/><line x1='23' y1='13' x2='23' y2='11'/><rect x='3' y='9' width='4' height='6'/>"

  const POWER =
    "<path d='M18.36 6.64a9 9 0 1 1-12.73 0'/><line x1='12' y1='2' x2='12' y2='12'/>"

  const POWER_OFF =
    "<path d='M18.36 6.64A9 9 0 0 1 20.77 15'/><path d='M6.16 6.16a9 9 0 1 0 12.68 12.68'/><line x1='12' y1='2' x2='12' y2='12'/><line x1='2' y1='2' x2='22' y2='22'/>"

  const BRIGHTNESS =
    "<circle cx='12' cy='12' r='5'/><line x1='12' y1='1' x2='12' y2='3'/><line x1='12' y1='21' x2='12' y2='23'/><line x1='4.22' y1='4.22' x2='5.64' y2='5.64'/><line x1='18.36' y1='18.36' x2='19.78' y2='19.78'/><line x1='1' y1='12' x2='3' y2='12'/><line x1='21' y1='12' x2='23' y2='12'/><line x1='4.22' y1='19.78' x2='5.64' y2='18.36'/><line x1='18.36' y1='5.64' x2='19.78' y2='4.22'/>"

  const BRIGHTNESS_UP =
    "<circle cx='12' cy='12' r='4'/><line x1='12' y1='2' x2='12' y2='6'/><line x1='12' y1='18' x2='12' y2='22'/><line x1='4.93' y1='4.93' x2='7.76' y2='7.76'/><line x1='16.24' y1='16.24' x2='19.07' y2='19.07'/><line x1='2' y1='12' x2='6' y2='12'/><line x1='18' y1='12' x2='22' y2='12'/><line x1='4.93' y1='19.07' x2='7.76' y2='16.24'/><line x1='16.24' y1='7.76' x2='19.07' y2='4.93'/>"

  const BRIGHTNESS_DOWN =
    "<circle cx='12' cy='12' r='3'/><line x1='12' y1='5' x2='12' y2='7'/><line x1='12' y1='17' x2='12' y2='19'/><line x1='6.34' y1='6.34' x2='7.76' y2='7.76'/><line x1='16.24' y1='16.24' x2='17.66' y2='17.66'/><line x1='5' y1='12' x2='7' y2='12'/><line x1='17' y1='12' x2='19' y2='12'/><line x1='6.34' y1='17.66' x2='7.76' y2='16.24'/><line x1='16.24' y1='7.76' x2='17.66' y2='6.34'/>"

  const VOLUME_OFF =
    "<polygon points='11 5 6 9 2 9 2 15 6 15 11 19 11 5'/><line x1='23' y1='9' x2='17' y2='15'/><line x1='17' y1='9' x2='23' y2='15'/>"

  const VOLUME_LOW =
    "<polygon points='11 5 6 9 2 9 2 15 6 15 11 19 11 5'/><path d='M15.54 8.46a5 5 0 0 1 0 7.07'/>"

  const VOLUME_HIGH =
    "<polygon points='11 5 6 9 2 9 2 15 6 15 11 19 11 5'/><path d='M19.07 4.93a10 10 0 0 1 0 14.14M15.54 8.46a5 5 0 0 1 0 7.07'/>"

  const VIBRATE =
    "<rect x='3' y='2' width='8' height='20' rx='1'/><line x1='15' y1='6' x2='15' y2='18'/><line x1='19' y1='8' x2='19' y2='16'/>"

  const NOTIFICATION =
    "<circle cx='12' cy='12' r='10'/><circle cx='12' cy='12' r='3'/>"

  const NOTIFICATION_OFF =
    "<circle cx='12' cy='12' r='10'/><line x1='4.93' y1='4.93' x2='19.07' y2='19.07'/>"
}
