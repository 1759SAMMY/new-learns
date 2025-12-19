def search_contact(name):
    found = [contacts for contacts in contacts if contacts['name'].lower() == name.lower()]

    if found:
        for contact in found:
            print(fnFound {contact[name]}- {contact[phone]})
            
    else:
        print(fnContact, with name {name} not found.)
search_contact(Alice)   
        
