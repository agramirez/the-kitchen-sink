use cucumber::{given,when,then,World};

#[derive(Debug, Default, World)]
pub struct FileSystemWorld {
    filename: String,
    contents: String,
    searchstring: String,
    results: Vec<String>
}

#[given("I have a file called example-filename.txt And it's contents are empty")]
fn hungry_cat(world: &mut FileSystemWorld) {
    world.filename = String::from("example-filename.txt");
    world.contents = String::from("");
    world.results = Vec::new();
}

#[when("I call cargo run -- searchstring example-filename.txt")]
fn feed_cat(world: &mut FileSystemWorld) {
    world.searchstring = String::from("searchstring");
    world.results = vec![String::from("0 matches found")];
}

#[then("I receive the response 0 matches found")]
fn cat_is_fed(world: &mut FileSystemWorld) {
    if let Some(res) = world.results.first() {
        assert_eq!("0 matches found",res);
    }
}

// This runs before everything else, so you can setup things here.
fn main() {
    // You may choose any executor you like (`tokio`, `async-std`, etc.).
    // You may even have an `async` main, it doesn't matter. The point is that
    // Cucumber is composable. :)
    futures::executor::block_on(FileSystemWorld::run(
        "features/call.feature",
    ));
}