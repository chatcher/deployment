#!/usr/bin/env bash

export CS_N="\033[0m"
export CS_S="\033[m"
#export CS_E
#export CS_W

#export CS_I
#export CS_P
#export CS_A

function writecolor() {
	color="$1"
	label="${2:-$color}"
	length="${#label}"
	prefix=''
	if (( length < 3 )); then prefix=' '; fi
	echo -en "\033[${color}m${prefix}${label}\033[0m"
}

function writecolorbox() {
	color="$1"
	echo -en "\033[48;5;${color}m  \033[0m"
}

function colors() {
echo
echo -e "\tColors"
echo
echo '  Format: \033[<n>m'
writecolor 1 '1 - bold'; echo
writecolor 2 '2 - dim'; echo
writecolor 3 '3 - italic'; echo
writecolor 4 '4 - underline'; echo
writecolor 5 '5 - slow blink'; echo
writecolor 6 '6 - fast blink'; echo
writecolor 7 '7 - reverse'; echo
writecolor '' '8 - conceal '; writecolor 8 '(not supported)'; echo
writecolor 9 '9 - strike'; echo

echo
echo '  Format: \033[<n>m'
for index in {30..37}; do
	writecolor "${index}"
done
echo

for index in {90..97}; do
	writecolor "${index}"
done
echo

for index in {40..47}; do
	writecolor "${index}"
done
echo

for index in {100..107}; do
	writecolor "30;${index}" "${index}"
done
echo

echo
echo '  Format: \033[38;5;<x+y>m'
echo -n '   '
for odd in {1..9..2}; do
	echo -n "   ${odd}"
done
for odd in {11..35..2}; do
	echo -n "  ${odd}"
done
echo

echo -n '   '
for even in {0..9..2}; do
	echo -n " ${even}  "
done
for even in {10..35..2}; do
	echo -n "${even}  "
done
echo

for redindex in {0..5}; do
	red="$(( redindex * 36 ))"
	row="$(( 16 + redindex * 36 ))"
	if (( row < 100 )); then echo -n ' '; fi
	echo -n "${row}"
	for greenindex in {0..5}; do
		green="$(( greenindex * 6 ))"
		for blue in {0..5}; do
			color="$(( 16 + red + green + blue ))"
			writecolorbox "${color}"
		done
	done
	echo
done
for grey in {232..243}; do
	writecolor "48;5;${grey}" "${grey}"; echo -n ' '
done
echo
for grey in {244..255}; do
	writecolor "30;48;5;${grey}" "${grey}"; echo -n ' '
done
echo

}

export colors
