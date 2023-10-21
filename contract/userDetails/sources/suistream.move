// Copyright (c) 2022, Sui Foundation
// SPDX-License-Identifier: Apache-2.0


module suistream::suistream {
use std::string;
    use std::vector;
    
use sui::object::{Self, UID};
use sui::transfer;
use sui::tx_context::{Self, TxContext};



//This struct is used to keep the record of all the videos available on SuiStream

struct AllUrls has key,store {
    id: UID,
    links: vector<address>,
}

//This struct is used to keep the record of all the videos uploaded by the user on SuiStream

struct userVid has key,store {
    id: UID,
    links: vector<address>,
}



     /// Will add url to the database
    public entry fun addUrl(ctx: &mut TxContext,value) {
        let admin = AllUrls {
            id: object::new(ctx),
            links:vector::empty(),
        };

        // transfer the forge object to the module/package publisher
        transfer::transfer(admin, tx_context::sender(ctx));
    }

     /// WIll add url to the user's database
    public entry fun addUrlToUser(ctx: &mut TxContext,value) {
        let admin = userVid {
            id: object::new(ctx),
            links:vector::empty(),
        };

        // transfer the forge object to the module/package publisher
        transfer::transfer(admin, tx_context::sender(ctx));
    }


}
