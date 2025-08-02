{pkgs, ...}: {
  environment.systemPackages = [
    pkgs.kanata
  ];

  services.kanata = {
    enable = true;
    keyboards = {
      default = {
        extraDefCfg = ''
          process-unmapped-keys yes
          concurrent-tap-hold yes
        '';
        config = ''
          (defsrc
            grv  1    2    3    4    5    6    7    8    9    0    -    =    bspc
            tab  q    w    e    r    t    y    u    i    o    p    [    ]    ret
            caps a    s    d    f    g    h    j    k    l    ;    '    \
            lsft z    x    c    v    b    n    m    ,    .    /    rsft
            lctl lmet lalt           spc            ralt rmet rctl
          )
          (defvar
            tap-time 200
            hold-time 150
            chord-s 30
            chord-m 50
          )
          (defalias
            caps esc
            d_shft (tap-hold $tap-time $hold-time d lsft)
            k_shft (tap-hold $tap-time $hold-time k lsft)
            f_meta (tap-hold $tap-time $hold-time f lmeta)
            j_meta (tap-hold $tap-time $hold-time j lmeta)
            s_alt (tap-hold $tap-time $hold-time s ralt)
            l_alt (tap-hold $tap-time $hold-time l ralt)

            ;; Layouts
            spc_mod (tap-hold $tap-time $hold-time spc (layer-while-held special))
            game_toggle (switch
              ((layer game)) (layer-switch base) break
              () (layer-switch game) break)
          )

          (defchordsv2
            ;; Left Hand
            (z x c) @game_toggle $chord-s all-released ()
            (d f) lctrl $chord-s all-released (game)
            (s d) lshft $chord-s all-released (game)
            (s d f) (multi lshft lctrl) $chord-s all-released (game)
            (a s) ralt $chord-s all-released (game)
            (w e) lmeta $chord-s all-released (game)
            (w e r) (multi lmeta rshft) $chord-s all-released (game)

            ;; Right Hand
            (j k) lctrl $chord-s all-released (game)
            (k l) lshft $chord-s all-released (game)
            (j k l) (multi lshft lctrl) $chord-s all-released (game)
            (l ;) ralt $chord-s all-released (game)
            (i o) lmeta $chord-s all-released ()
            (u i o) (multi lmeta rshft) $chord-s all-released ()
          )

          (deflayer base
            grv   1    2      3    4    5    6    7    8    9    0    -    =    bspc
            tab   q    w      e    r    t    y    u    i    o    p    [    ]    ret
            @caps a    s      d    f    g    h    j    k    l  ;  '  \
            lsft  z    x      c    v    b    n    m    ,    .    /    rsft
            lctl  lmet lalt             @spc_mod            ralt rmet rctl
          )

          (deflayer special
            _          f1   f2   f3   f4   f5   f6   f7    f8   f9   f10  f11   f12  _
            S-prtsc    1    2    3    4    5    6    7     8    9    0    =     S-=    ret
            caps       S-1  S-2  S-3  S-4  S-5  AG-6 S-9   S-0  [    ]  S-7     S-8
            C-S-prtsc  prev pp   next mute voldwn    volu  -    S--  S-7  S-8   rsft
            prtsc      lmet lalt           @spc_mod        ralt rmet      rctl
          )

          (deflayer game
            grv   1    2    3    4    5    6    7    8    9    0    -    =    bspc
            tab   q    w    e    r    t    y    u    i    o    p    [    ]    ret
            caps  a    s    d    f    g    h    j    k    l    ;    '    \
            lsft  z    x    c    v    b    n    m    ,    .    /    rsft
            lctl  lmet lalt           spc            ralt rmet rctl
          )
        '';
      };
    };
  };
}
# Better tmux key, another layout for arrows and page up / down using space + another key
# Remove too much shortcut for print replace with useful stuff

