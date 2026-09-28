// Each Item Object has 3 variables: 
//     ID (Primary Key of the Object)
//     Name (Name of the Item)
//     Description (Description of the Item)


// The inventory should probably be implemented as a dynamic list (meaning that the inventory
// can expand and contract to match the amount of items in the player inventory.)

inventory = ds_list_create();

ds_list_add(inventory, new ScientistID());
