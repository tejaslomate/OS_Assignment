echo "enter num1:"
read a
echo "enter num2:"
read b
echo "enter choice 1.add 2.sub 3.mul 4.div"
read c
case $c in 
1)
((s=a+b))
echo "result:$s";;
2)
((s=a-b))
echo "result:$s";;
3)
((s=a*b))
echo "result:$s";;
4)
((s=a/b))
echo "result:$s";;

esac
