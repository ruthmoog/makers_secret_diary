# Secret Diary

Just a simple diary that needs to be unlocked to see or change what's inside.

```
SecretDiary
  - lock
  - unlock
  - add_entry
  - get_entries

Initially the `SecretDiary` class is locked, meaning `add_entry` and `get_entries` should throw an error.

When the user calls `unlock`, `add_entry` and `get_entries` should work as desired.

When the user calls `lock` again they throw errors again.
```

## More info

I've used RSpec & TDD to create the files.

I considered cohesion and encapsulation and seperated the code into two classes.

So that the tests would be uncoupled, I used doubles and spies to test the diary behavior without relying on the `Lock` class.

## Run the tests

install RSpec and run in the command line with `rspec` in the main directory.

## Resources

Secret Diary is a practical OO exersize from Makers Academy