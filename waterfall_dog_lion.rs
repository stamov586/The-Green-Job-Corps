// Header

#![allow(non_snake_case, unused_variables)]

// Module imports
use std::io;

// Constants
const VOLUNTEER_AGE_LIMIT: i32 = 18;
const GOVERNMENT_ASSISTANCE_LIMIT: i32 = 24;

// Structs
struct Participant {
  name: String,
  age: i32,
  income: i32,
  has_government_assistance: bool,
}

// Functions
fn read_input() -> String {
  let mut input = String::new();
  io::stdin().read_line(&mut input).expect("Failed to read line!");
  input
}

fn get_participant_data() -> Participant {
  println!("Please enter your name: ");
  let name = read_input();
  println!("Please enter your age: ");
  let age: i32 = read_input().trim().parse().expect("Must enter a number");
  println!("Please enter your annual income: ");
  let income: i32 = read_input().trim().parse().expect("Must enter a number");
  println!("Are you receiving government assistance? (yes/no)");
  let mut assistance: bool = false;
  let mut response = read_input();
  while !(response == "yes" || response == "no") {
    println!("Please enter yes or no");
    response = read_input();
  }
  if response == "yes" {
    assistance = true;
  }
  Participant {
    name: name,
    age: age,
    income,
    has_government_assistance: assistance,
  }
}

fn check_participant_eligibility(participant: &Participant) -> bool {
  participant.age >= VOLUNTEER_AGE_LIMIT &&
    (participant.income < GOVERNMENT_ASSISTANCE_LIMIT ||
     !participant.has_government_assistance)
}

// Main
fn main() {
  let participant = get_participant_data();

  if check_participant_eligibility(&participant) {
    println!("Congratulations {}, you are eligible to join The Green Job Corps!", participant.name);
  } else {
    println!("Unfortunately, {} you are not eligible to join The Green Job Corps at this time.", participant.name);
  }
}