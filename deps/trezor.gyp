{ 'targets': [
    {
      'target_name': 'trezor',
      'type': 'static_library',
      'sources': [
        "trezor/bip39.c",
        "trezor/hmac.c",
        "trezor/memzero.c",
        "trezor/pbkdf2.c",
        "trezor/rand.c",
        "trezor/sha2.c"
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
          'trezor',
        ]
      },
      'include_dirs': [
        'trezor',
      ],
    },
  ]
}
