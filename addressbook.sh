#!/bin/bash

CONTACTS_FILE="contacts.txt"

add_contact() {
    echo "Enter name:"
    read name
    echo "Enter phone number:"
    read phone
    echo "Enter email:"
    read email
    echo "$name|$phone|$email" >> "$CONTACTS_FILE"
    echo "Contact added successfully."
}

search_contacts() {
    echo "Enter search term:"
    read search_term
    grep -i "$search_term" "$CONTACTS_FILE"
}

remove_contact() {
    echo "Enter name, phone number, or email to remove:"
    read remove_term
    sed -i "/$remove_term/d" "$CONTACTS_FILE"
    echo "Contact(s) removed successfully."
}

case "$1" in
    add)
        add_contact
        ;;
    search)
        search_contacts
        ;;
    remove)
        remove_contact
        ;;
    *)
        echo "Usage: $0 {add|search|remove}"
        exit 1
        ;;
esac