#!/usr/bin/env bash

export N_CS="\033[0m"  # normal  - white
export S_CS="\033[32m" # status  - green
export E_CS="\033[31m" # error   - red
export W_CS="\033[33m" # warning - orange

export I_CS="\033[38;5;39m" # info   - blue
export D_CS="\033[35m"      # debug  - purple
export P_CS="\033[93m"      # prompt - yellow
export A_CS="\033[31m\a"    # alert  - red with bell
export K_CS="\033[90m"      # trace  - grey
export L_CS="\033[36;4m"    # link   - cyan, underline

export U_CS="\033[4m" # underline
export B_CS="\033[5m" # blinky
export C_CS="\033[24;25m" # cancel underline and blink

function color_vars() {
	echo -e "\${N_CS} : ${N_CS}normal${N_CS}  - white"
	echo -e "\${S_CS} : ${S_CS}status${N_CS}  - green"
	echo -e "\${E_CS} : ${E_CS}error${N_CS}   - red"
	echo -e "\${W_CS} : ${W_CS}warning${N_CS} - brown"

	echo -e "\${A_CS} : ${E_CS}alert${N_CS}   - red with bell"
	echo -e "\${I_CS} : ${I_CS}info${N_CS}    - blue"
	echo -e "\${D_CS} : ${D_CS}debug${N_CS}   - purple"
	echo -e "\${K_CS} : ${K_CS}dark${N_CS}    - grey"
	echo -e "\${P_CS} : ${P_CS}prompt${N_CS}  - yellow"
	echo -e "\${L_CS} : ${L_CS}link${N_CS}    - cyan, underline"
}

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
	color_vars
	echo
	echo '  Format: \\e[<n>m'
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
	echo '  Format: \\e[<n>m'
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
	echo '  Format: \\e[38;5;<x+y>m'
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

	echo -n "   "
	for grey in {232..243}; do
		writecolor "48;5;${grey}" " ${grey} "
	done
	echo
	echo -n "   "
	for grey in {232..243}; do
		writecolor "48;5;${grey}" "     "
	done
	echo

	echo -n "   "
	for grey in {244..255}; do
		writecolor "30;48;5;${grey}" " ${grey} "
	done
	echo

	echo -n "   "
	for grey in {244..255}; do
		writecolor "30;48;5;${grey}" "     "
	done
	echo
}

export colors
