# NeoVim
alias nvi="nvim"
alias vim="nvim"

# composer
alias cps="composer"
alias cpsi="composer install"
alias cpsr="composer require"
alias cpsu="composer update"
alias cpsgu="composer global update"
alias cpsda="composer dump-autoload"

# switch php version
alias switchphp="sudo update-alternatives --config php"

# php artisan
alias pa="php artisan"
alias pas="php artisan serve"
alias pamg="php artisan migrate"
alias pat="php artisan tinker"
alias pao="php artisan optimize"
alias pao:c="php artisan optimize:clear"
pamg:() {
	php artisan migrate:"$1" "${@:2}"
}
pamk:() {
	php artisan make:"$1" "${@:2}"
}

# laravel ide helper
alias ide="php artisan ide-helper:generate && php artisan ide-helper:meta && php artisan ide-helper:models --nowrite"
alias ide:gen="php artisan ide-helper:generate"
alias ide:meta="php artisan ide-helper:meta"
alias ide:models="php artisan ide-helper:models --nowrite"

# php test
alias phpunit="vendor/bin/phpunit"
alias pest="vendor/bin/pest"

# valet
alias val="valet"
alias valu="valet use"
alias vall="valet link"
alias valls="valet links"
alias valul="valet unlink"
vali() {
	valet isolate --site="$1" "$2"
}
# npm
alias ni="npm install"
alias nid="npm install -D"
alias nu="npm update"
alias nug="npm update -g"
alias nr="npm remove"
alias nrb="npm run build"
alias nrd="npm run dev"

# pnpm
alias pna="pnpm add"
alias pnad="pnpm add -D"
alias pni="pnpm install"
alias pnu="pnpm update"
alias pnug="pnpm update -g"
alias pnr="pnpm remove"
alias pnrb="pnpm run build"
alias pnrd="pnpm run dev"
