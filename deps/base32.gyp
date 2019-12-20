{ 'targets': [
    {
      'target_name': 'base32',
      'type': 'static_library',
      'sources': [
        "base32/base32.c"
      ],
      'cflags': [
        '-Wno-unused-const-variable',
        '-Wno-unused-parameter',
        '-v'
      ],
      'cflags!': [
        '-Werror',
        '-Wextra',
      ],
      'xcode_settings': {
        'OTHER_CFLAGS' : ['<@(_cflags)'],
        'OTHER_CFLAGS!' : ['-Wextra', '-Werror'],
      },
      'all_dependent_settings': {
        'include_dirs': [
          '.',
          'base32',
        ]
      },
      'include_dirs': [
        'base32',
      ],
    },
  ]
}
