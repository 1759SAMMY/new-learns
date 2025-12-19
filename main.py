contacts = []
def add_contact(name, phone):
    contacts.append({'name': name, 'phone': phone})
    print(fContact {name} added successfully!)
    
def view_contacts():
    if not contacts:
        print(No contacts found.)
    else:
        print(nContacts List:)
        for i, contact in enumerate(contacts, 1):
            print(f{i}. Name: {contact[name]}, Phone: {contact[phone]})
add_contact(Alice, 123-456-7890)
add_contact(Bob, 987-654-3210) 
view_contacts()
