#!/bin/bash
	touch /root/桌面/abc.txt
function clearing()
{
	clear;
	echo -e -n "\n\n\n"

	echo -e -n '              '		#制作上边框
	for ((k=1;$k<=19;k++))
	do
		echo -e -n '--'
	done
	echo -e -n "\n"

	for ((k=1;$k<=19;k++))
	do

		echo -e -n '            '	#制作左边框
		echo -e -n '| '
							#制作核心棋盘
		for ((l=1;$l<=19;l++))
		do
			thing_bool=false
			
			for ((i=1;$i<=$white;i++))
			do
				if [[ $k -eq ${white_k[$i]}&&$l -eq ${white_l[$i]} ]]
				then
					if [[ $k -eq $mouse_k&&$l -eq $mouse_l ]]
					then
						echo -e -n "\033[1;32;41mX \033[0m"
					else
						echo -e -n "X "
					fi
					thing_bool=true
				fi
			done
			for ((i=1;$i<=$black;i++))
			do
				if [[ $k -eq ${black_k[$i]}&&$l -eq ${black_l[$i]} ]]
				then
					if [[ $k -eq $mouse_k&&$l -eq $mouse_l ]]
					then
						echo -e -n "\033[1;32;41mO \033[0m"
					else
						echo -e -n "O "
					fi
					thing_bool=true
				fi
			done

			if [[ $k -eq $mouse_k&&$l -eq $mouse_l&&$thing_bool == false ]]
			then
				echo -e -n "\033[1;31;41m  \033[0m"
				thing_bool=true
			fi
			if [ $thing_bool == false ]
			then
 				echo -e -n ". "
			fi
		done

		echo -e -n '| '			#制作左边框
		echo -e -n "\n"
	done

	echo -e -n '              '		#制作下边框
	for ((k=1;$k<=19;k++))
	do
		echo -e -n '--'
	done
	echo -e -n "\n\n\n"
}
mouse_k=10
mouse_l=10
white=0
black=0
clearing
while (true)
do
	read mouse_move
	mouse_move=${mouse_move:0:1}
	if [ $mouse_move == w -a $mouse_k -ge 2 ]
	then
		let mouse_k--
	elif [ $mouse_move == s -a $mouse_k -le 18 ]
	then
		let mouse_k++
	elif [ $mouse_move == a -a $mouse_l -ge 2 ]
	then
		let mouse_l--
	elif [ $mouse_move == d -a $mouse_l -le 18 ]
	then
		let mouse_l++
	elif [ $mouse_move == j ]
	then
		let white++
		white_k[$white]=$mouse_k
		white_l[$white]=$mouse_l
	elif [ $mouse_move == k ]
	then
		let black++
		black_k[$black]=$mouse_k
		black_l[$black]=$mouse_l
	fi
	clearing
done
