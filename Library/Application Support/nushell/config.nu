# nushell configs
$env.config.show_banner = false
$env.config.edit_mode = 'vi'
$env.config.rm.always_trash = true
$env.config.buffer_editor = 'nvim'

# env variables
$env.GOPATH = ($env.HOME | path join 'go')
$env.PNPM_HOME = ($env.HOME | path join 'Library' 'pnpm')
$env.EDITOR = 'nvim'
$env.PAGER = 'bat --style=-numbers'
$env.HOMEBREW_NO_AUTO_UPDATE = '1'
$env.PATH = ($env.PATH | prepend [
    '/usr/local/bin'
    '/opt/homebrew/bin',
    '/Applications/Visual Studio Code.app/Contents/Resources/app/bin'
    '/Applications/Ghostty.app/Contents/MacOS/ghostty'
    ($env.GOPATH | path join 'bin')
    ($env.HOME | path join '.local' 'bin')
    ($env.HOME | path join 'bin')
    ($env.HOME | path join '.krew' 'bin')
    ($env.HOME | path join '.lmstudio' 'bin')
    ($env.PNPM_HOME | path join 'bin')
])

# terminal colours
tinty apply base16-catppuccin-mocha

# abbreviations
$env.config.abbreviations = {
    xopen: '^open'
    xcat: '^cat'
    xcd: '^cd'

    # General abbreviations.
    cd: 'z'
    cp: 'cp -i'
    dud: 'du -d 1 -h'
    h: 'history'
    cat: 'bat --style=-numbers'
    mv: 'mv -i'
    p: '^procs -f'
    rm: 'rm -i'
    t: 'tail -f'
    ps: 'procs'
    q: "q -d ','"
    tf: 'tofu'
    vi: 'nvim'
    vim: 'nvim'
    g: 'git'

    # Git abbreviations.
    ga: 'git add'
    gaa: 'git add --all'
    gst: 'git status'
    gc: 'git commit --verbose'
    gb: 'git branch'
    gca: 'git commit --verbose --all'
    gco: 'git checkout'
    gcb: 'git checkout -b'
    grb: 'git rebase'
    grba: 'git rebase --abort'
    grbc: 'git rebase --continue'
    grbi: 'git rebase --interactive'
    gm: 'git merge'
    gma: 'git merge --abort'
    gmc: 'git merge --continue'
    gd: 'git diff'
    gp: 'git push'
    gl: 'git pull'
    gpu: 'git push upstream'
    ggp: 'git push origin'

    # Kubernetes abbreviations.
    k: 'kubectl'
    kcx: 'kubectx'
    kns: 'kubens'
    s: 'stern'
    kaf: 'kubectl apply -f'
    keti: 'kubectl exec -t -i'
    kgp: 'kubectl get pods'
    kpf: 'kubectl port-forward'
    kdel: 'kubectl delete'
}
