#!/bin/sh

print_list() {
  reset

  echo "(1) - Search Address Book"
  echo "(2) - Add an Address Book entry"
  echo "(3) - Remove an Address Book entry"
  echo "(4) - For quit the app, press 4, goodbye..."

  echo "Select the number of your choice on the list, or quit by pressing q"
}

read_record() {

  RECORD=$1
  ROLLNO=$(nl address.txt | grep -w $RECORD | awk '{print $2}')
  NAME=$(nl address.txt | grep -w $RECORD | awk '{print $3}')
  PHONE=$(nl address.txt | grep -w $RECORD | awk '{print $4}')

  echo "roll no: $ROLLNO , Name: $NAME , Phone: $PHONE"
}

insert_record() {
 
  echo "please enter name "
  read NAME
  echo "please enter roll number"
  read ROLLNO
  echo "please enter phone number "
  read PHONE 
  echo "Adding address book entry..."
  echo "rollno:$ROLLNO name:$NAME $PHONE" >> address.txt
  echo "data inserted!"
}

remove_record() {
  DATA=$1
  echo "Removing address book entry"
  sed -i "/$DATA/d" address.txt
}

go_back() {
  echo "for going back to main menu pres m, for quit press q"

  read CHOICE_MENU
  if [ $CHOICE_MENU = "m" ]; then
    print_list
    read CHOICE
    elif [ $CHOICE_MENU = "q" ]; then
      exit 0
    else 
      echo "the command you typed is not correct, for main menu press m, for quit type q"
  fi
}

echo "Welcome to Addressbook app v1 ..."

print_list

read CHOICE

while [ $CHOICE -ne 4 ]
do
  if [ $CHOICE -eq 1 ]; then
    echo "please enter either id,name or phone number"
    read QUERY
    read_record $QUERY
    go_back
    elif [ $CHOICE -eq 2 ]; then
      insert_record
      go_back
    elif [ $CHOICE -eq 3 ]; then
      echo "please enter either id,name or phone number of user that you want to remove"
      read USER
      remove_record $USER
      go_back
    else 
      exit 0
  fi
done

