begin
  defaults = YAML.load_file("#{Rails.root}/config/defaults/wc22.yml")
  DEFAULT_ADMINS = JSON.parse(defaults['admins'].to_json, object_class: OpenStruct)
  DEFAULT_PHASES = JSON.parse(defaults['phases'].to_json, object_class: OpenStruct)
  DEFAULT_TEAMS = JSON.parse(defaults['teams'].to_json, object_class: OpenStruct)
  DEFAULT_MATCHES = JSON.parse(defaults['matches'].to_json, object_class: OpenStruct)
rescue Errno::ENOENT, Psych::SyntaxError
  Rails.logger.error 'An error occured while loading defaults.yml'
end
DEFAULT_ADMINS ||= []
DEFAULT_PHASES ||= []
DEFAULT_TEAMS ||= []
DEFAULT_TOURNAMENTS ||= []


DEFAULTS = {
  "admins": [],
  "phases": [
    {
      "code": "A",
      "level": 1,
      "small_points": 1,
      "big_points": 3,
      "active": true
    },
    {
      "code": "B",
      "level": 1,
      "small_points": 1,
      "big_points": 3,
      "active": true
    },
    {
      "code": "C",
      "level": 1,
      "small_points": 1,
      "big_points": 3,
      "active": true
    },
    {
      "code": "D",
      "level": 1,
      "small_points": 1,
      "big_points": 3,
      "active": true
    },
    {
      "code": "quarter_finals",
      "level": 2,
      "small_points": 2,
      "big_points": 5,
      "active": false
    },
    {
      "code": "semi_finals",
      "level": 3,
      "small_points": 3,
      "big_points": 7,
      "active": false
    },
    {
      "code": "final",
      "level": 4,
      "small_points": 4,
      "big_points": 9,
      "active": false
    }
  ],
  "teams": [
    {
      "code": "can",
      "group": "A"
    },
    {
      "code": "cub",
      "group": "A"
    },
    {
      "code": "mar",
      "group": "A"
    },
    {
      "code": "mex",
      "group": "A"
    },
    {
      "code": "ber",
      "group": "B"
    },
    {
      "code": "crc",
      "group": "B"
    },
    {
      "code": "hai",
      "group": "B"
    },
    {
      "code": "nic",
      "group": "B"
    },
    {
      "code": "cur",
      "group": "C"
    },
    {
      "code": "sal",
      "group": "C"
    },
    {
      "code": "hon",
      "group": "C"
    },
    {
      "code": "jam",
      "group": "C"
    },
    {
      "code": "guy",
      "group": "D"
    },
    {
      "code": "pan",
      "group": "D"
    },
    {
      "code": "tyt",
      "group": "D"
    },
    {
      "code": "usa",
      "group": "D"
    }
  ],
  "matches": [
    {
      "date": "2019-06-15 17:30 CST",
      "team1": "can",
      "team2": "mar",
      "phase": "A"
    },
    {
      "date": "2019-06-15 20:00 CST",
      "team1": "mex",
      "team2": "cub",
      "phase": "A"
    },
    {
      "date": "2019-06-16 16:00 CST",
      "team1": "hai",
      "team2": "ber",
      "phase": "B"
    },
    {
      "date": "2019-06-16 18:30 CST",
      "team1": "crc",
      "team2": "nic",
      "phase": "B"
    },
    {
      "date": "2019-06-17 17:00 CST",
      "team1": "cur",
      "team2": "sal",
      "phase": "C"
    },
    {
      "date": "2019-06-17 19:30 CST",
      "team1": "jam",
      "team2": "hon",
      "phase": "C"
    },
    {
      "date": "2019-06-18 17:30 CST",
      "team1": "pan",
      "team2": "tyt",
      "phase": "D"
    },
    {
      "date": "2019-06-18 20:00 CST",
      "team1": "usa",
      "team2": "guy",
      "phase": "D"
    },
    {
      "date": "2019-06-19 18:00 CST",
      "team1": "cub",
      "team2": "mar",
      "phase": "A"
    },
    {
      "date": "2019-06-19 20:30 CST",
      "team1": "mex",
      "team2": "can",
      "phase": "A"
    },
    {
      "date": "2019-06-20 17:00 CST",
      "team1": "nic",
      "team2": "hai",
      "phase": "B"
    },
    {
      "date": "2019-06-20 19:30 CST",
      "team1": "crc",
      "team2": "ber",
      "phase": "B"
    },
    {
      "date": "2019-06-21 17:00 CST",
      "team1": "sal",
      "team2": "jam",
      "phase": "C"
    },
    {
      "date": "2019-06-21 19:30 CST",
      "team1": "hon",
      "team2": "cur",
      "phase": "C"
    },
    {
      "date": "2019-06-22 15:30 CST",
      "team1": "guy",
      "team2": "pan",
      "phase": "D"
    },
    {
      "date": "2019-06-22 18:00 CST",
      "team1": "usa",
      "team2": "tyt",
      "phase": "D"
    },
    {
      "date": "2019-06-23 16:00 CST",
      "team1": "can",
      "team2": "cub",
      "phase": "A"
    },
    {
      "date": "2019-06-23 18:30 CST",
      "team1": "mar",
      "team2": "mex",
      "phase": "A"
    },
    {
      "date": "2019-06-24 16:30 CST",
      "team1": "ber",
      "team2": "nic",
      "phase": "B"
    },
    {
      "date": "2019-06-24 19:00 CST",
      "team1": "hai",
      "team2": "crc",
      "phase": "B"
    },
    {
      "date": "2019-06-25 18:00 CST",
      "team1": "jam",
      "team2": "cur",
      "phase": "C"
    },
    {
      "date": "2019-06-25 20:30 CST",
      "team1": "hon",
      "team2": "sal",
      "phase": "C"
    },
    {
      "date": "2019-06-26 16:30 CST",
      "team1": "tyt",
      "team2": "guy",
      "phase": "D"
    },
    {
      "date": "2019-06-26 19:00 CST",
      "team1": "pan",
      "team2": "usa",
      "phase": "D"
    },
    {
      "date": "2019-06-29 17:00 CST",
      "phase": "quarter_finals",
      "team1_label": "1B",
      "team2_label": "2A"
    },
    {
      "date": "2019-06-29 20:00 CST",
      "phase": "quarter_finals",
      "team1_label": "1A",
      "team2_label": "2B"
    },
    {
      "date": "2019-06-30 15:30 CST",
      "phase": "quarter_finals",
      "team1_label": "1C",
      "team2_label": "2D"
    },
    {
      "date": "2019-06-30 18:30 CST",
      "phase": "quarter_finals",
      "team1_label": "1D",
      "team2_label": "2C"
    },
    {
      "date": "2019-07-02 20:30 CST",
      "phase": "semi_finals",
      "team1_label": "W25",
      "team2_label": "W26"
    },
    {
      "date": "2019-07-03 19:30 CST",
      "phase": "semi_finals",
      "team1_label": "W27",
      "team2_label": "W28"
    },
    {
      "date": "2019-07-07 19:15 CST",
      "phase": "final",
      "team1_label": "W29",
      "team2_label": "W30"
    }
  ]
}
