a='\033[30;0m'
h='\033[32;1m'
m='\033[31;1m'
c='\033[36;1m'
p='\033[1;35m'
k='\033[33;1m'
b='\033[34;m'

detik=$(date +%S)
menit=$(date +%M)
hari=$(date +%D)
up=$(uptime -p)
device=$(getprop ro.product.model)
cpu=$(grep -c processor /proc/cpuinfo)
kernel=$(uname -r)
arsi=$(uname -m)
ram=$( free -m | awk 'NR==2 {print $2}' )
sisa=$( free -m | awk 'NR==2 {print $3}' )
persen=$( free -m | awk 'NR==2 {print $4}' )

jam=$(date +%H)


# Array untuk nama hari dalam bahasa Indonesia
hari=("Minggu" "Senin" "Selasa" "Rabu" "Kamis" "Jumat" "Sabtu")                                     
# Array untuk nama bulan dalam bahasa Indonesia
bulan=("Januari" "Februari" "Maret" "April" "Mei" "Juni" "Juli" "Agustus" "September" "Oktober" "November" "Desember")

# Mendapatkan tanggal saat ini
tanggal=$(date +%d)

# Mendapatkan hari dalam seminggu (0-6, di mana 0 adalah Minggu)
indeks_hari=$(date +%w)

# Mendapatkan bulan (1-12)
indeks_bulan=$(( $(date +%m) - 1 ))

# Mendapatkan tahun
tahun=$(date +%Y)

# Menampilkan tanggal dalam format bahasa Indonesia
#echo "Hari ini ${hari[$indeks_hari]}, $tanggal ${bulan[$indeks_bulan]} $tahun"


# --- Opsional: Menambahkan waktu ---

# Mendapatkan jam, menit, dan detik
jam=$(date +%H)
menit=$(date +%M)
detik=$(date +%S)

# Menampilkan waktu
#echo "Pukul $jam:$menit:$detik WIB"


# --- Opsional: Format kustom ---

# Contoh format kustom:  "Senin, 1 Januari 2024"
# Gunakan 'man date' untuk melihat opsi format lainnya.
tanggal_kustom=$(date +"%A, %d %B %Y")
#echo "Format kustom: $tanggal_kustom"

# Dapatkan lokasi pengguna melalui IP.
# Anda bisa mengganti ini dengan lokasi spesifik, seperti "Jakarta,ID"
#location=$(curl -s ipinfo.io/city)

# Gunakan curl untuk mengambil data cuaca dari wttr.in
#weather=$(curl -s "wttr.in/$location?format=3")

# Menentukan sapaan berdasarkan waktu
if [[ $jam -ge 7 && $jam -lt 13 ]]; then
  sapaan="Selamat siang 🎇"
elif [[ $jam -ge 13 && $jam -lt 18 ]]; then
  sapaan="Selamat sore 🌄"
elif [[ $jam -ge 18 && $jam -lt 24 ]]; then
  sapaan="Selamat malam 🎑"
elif [[ $jam -ge 0 && $jam -lt 5 ]]; then
  sapaan="Selamat pagi 🌠"
else
  sapaan="Selamat pagi 🌅"
fi
# Menampilkan sapaan
#echo "Halo tuan jon, $sapaan!"

txtblk='\e[0;30m'
a='\033[30;0m'
h='\033[32;1m'
m='\033[31;1m'
c='\033[36;1m'
p='\033[1;35m'
k='\033[33;1m'
b='\033[34;m'
jam=$(date +%T)
hari=$(date +%A)
tanggal=$(date +%d)
bulan=$(date +%m)
tahun=$(date +%Y)

# Command history tweaks:
# - Append history instead of overwriting
#   when shell exits.
# - When using history substitution, do not
#   exec command immediately.
# - Do not save to history commands starting
#   with space.
# - Do not save duplicated commands.
shopt -s histappend
shopt -s histverify
export HISTCONTROL=ignoreboth

# Default coymmand line prompt.
PROMPT_DIRTRIM=2
PS1=root@ubuntu'\[\e[0;32m\]\w\[\e[0m\] \[\e[0;97m\]\$\[\e[0m\] '

# Handles nonexistent commands.
# If user has entered command which invokes non-available
# utility, command-not-found will give a package suggestions.
if [ -x /data/data/com.termux/files/usr/libexec/termux/command-not-found ]; then
	command_not_found_handle() {
		/data/data/com.termux/files/usr/libexec/termux/command-not-found "$1"
	}
fi

[ -r /data/data/com.termux/files/usr/share/bash-completion/bash_completion ] && . /data/data/com.termux/files/usr/share/bash-completion/bash_completion


alias ls=lsd
echo -e "$b notif :$h activate"
echo -e "$b magina :$k Hallo Tuan Jhon$h $sapaan"
echo -e "$b real team :$h $jam | $tanggal-$bulan-$tahun"
echo -e "$b dev:$h $device $m $up
$b cpu:$h $cpu $b kernel:$h $kernel $b arsi:$h $arsi
$b ram:$h $ram Mb $b user:$h $sisa Mb $b save:$h $persen% $a
"

