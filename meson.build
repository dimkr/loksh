project('loksh', 'c')

lolibc = subproject('lolibc')

c_args = ['-D_GNU_SOURCE', '-DEMACS', '-DVI', '-Wno-format-security', '-Wno-pointer-sign']
deps = []

ncurses = dependency('ncurses', required: false)
if ncurses.found()
	deps += [ncurses]
else
	c_args += ['-DSMALL']
endif

ksh = executable('ksh',
                 'alloc.c', 'c_ksh.c', 'c_sh.c', 'c_test.c', 'c_ulimit.c', 'edit.c', 'emacs.c', 'eval.c',
                 'exec.c', 'expr.c', 'history.c', 'io.c', 'jobs.c', 'lex.c', 'mail.c', 'main.c', 'misc.c',
                 'path.c', 'shf.c', 'syn.c', 'table.c', 'trap.c', 'tree.c', 'tty.c', 'var.c', 'version.c', 'vi.c',
                 c_args: c_args + lolibc.get_variable('lolibc_c_args'),
                 include_directories: lolibc.get_variable('lolibc_includes'),
                 dependencies: deps,
                 link_with: lolibc.get_variable('liblolibc'),
                 install: true)

install_man('ksh.1', 'sh.1')

install_data('README.md',
             'README',
             'CONTRIBUTORS',
             'PROJECTS',
             'LEGAL',
             install_dir: join_paths(get_option('datadir'), 'doc', 'loksh'))
