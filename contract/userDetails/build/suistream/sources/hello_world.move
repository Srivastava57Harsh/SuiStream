// Copyright (c) 2022, Sui Foundation
// SPDX-License-Identifier: Apache-2.0

// module hello_world::hello_world {

//     use std::string;
//     use sui::object::{Self, UID};
//     use sui::transfer;
//     use sui::tx_context::{Self, TxContext};

//     /// An object that contains an arbitrary string
//     struct HelloWorldObject has key, store {
//         id: UID,
//         /// A string contained in the object
//         // text: string::String
//         text: vector<address>
//     }

//     public entry fun mint(ctx: &mut TxContext) {
//         let object = HelloWorldObject {
//             id: object::new(ctx),
//             text: string::utf8(b"Hello World!")
//         };
//         transfer::public_transfer(object, tx_context::sender(ctx));
//     }
// }


    // You will need to change the entry function to accept an array of addresses.
// module hello_world::hello_world {
// use sui::tx_context::{Self, TxContext};
// use sui::object::{Self, UID};
// use sui::transfer;
// struct VecTest has key, store{
// id: UID,
// myvec: vector<address>
// }
// public entry fun test_vec(v: vector<address>, ctx: &mut TxContext) {
// transfer::transfer(
// VecTest {
// id: object::new(ctx),
// myvec: v
// },
// tx_context::sender(ctx))
// }}


// module hello_world::hello_world {
//     use sui::transfer;
//     use sui::object::{Self, UID};
//     use sui::tx_context::{Self, TxContext};

//     /// A shared counter.
//     struct Counter has key {
//         id: UID,
//         owner: address,
//         value: u64
//     }

//     public fun owner(counter: &Counter): address {
//         counter.owner
//     }

//     public fun value(counter: &Counter): u64 {
//         counter.value
//     }

//     /// Create and share a Counter object.
//     public entry fun create(ctx: &mut TxContext) {
//         transfer::share_object(Counter {
//             id: object::new(ctx),
//             owner: tx_context::sender(ctx),
//             value: 0
//         })
//     }

//     /// Increment a counter by 1.
//     public entry fun increment(counter: &mut Counter) {
//         counter.value = counter.value + 1;
//     }

//     /// Set value (only runnable by the Counter owner)
//     public entry fun set_value(counter: &mut Counter, value: u64, ctx: &TxContext) {
//         assert!(counter.owner == tx_context::sender(ctx), 0);
//         counter.value = value;
//     }

//     /// Assert a value for the counter.
//     public entry fun assert_value(counter: &Counter, value: u64) {
//         assert!(counter.value == value, 0)
//     }
// }



module hello_world::hello_world {
use std::string;
    use std::vector;
    
use sui::object::{Self, UID};
use sui::transfer;
use sui::tx_context::{Self, TxContext};

struct AllUrls has key,store {
    id: UID,
    links: vector<address>,
}

//    public entry fun create(ctx: &mut TxContext) {
//         transfer::share_object(AllUrls {
//             links: vector::empty()
//         })
//     }

     /// Module initializer to be executed when this module is published
    fun init(ctx: &mut TxContext) {
        let admin = AllUrls {
            id: object::new(ctx),
            links:vector::empty(),
        };

        // transfer the forge object to the module/package publisher
        transfer::transfer(admin, tx_context::sender(ctx));
    }


    //  public fun put<T>(ctx: &mut TxContext, value: string::String) {
    //     let admin = AllUrls {
    //         id: object::new(ctx),
    //         links: vector::push_back(&mut ctx.values,value),
    //     };

    //     // transfer the forge object to the module/package publisher
    //     transfer::transfer(admin, tx_context::sender(ctx));
    // }




    // struct Widget {
    // }

    // // Vector for a specified  type
    // struct WidgetVector {
    //     widgets: vector<Widget>
    // }

    // // Vector for a generic type 
    // struct GenericVector<T> {
    //     values: vector<T>
    // }

    // // Creates a GenericVector that hold a generic type T
    // public fun create<T>(){
    //         widgets: vector::empty<T>()
    // }

    // // Push a value of type T into a GenericVector
    // public fun put<T>(vec: &mut GenericVector<T>, value: T) {
    //     vector::push_back<T>(&mut vec.values, value);
    // }

    // // Pops a value of type T from a GenericVector
    // public fun remove<T>(vec: &mut GenericVector<T>): T {
    //     vector::pop_back<T>(&mut vec.values)
    // }

    // // Returns the size of a given GenericVector
    // public fun size<T>(vec: &mut GenericVector<T>): u64 {
    //     vector::length<T>(&vec.values)
    // }
}
