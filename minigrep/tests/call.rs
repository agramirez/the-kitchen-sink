use cucumber::{given,when,then,World,Step};
use minigrep;

#[derive(Debug, Default, World)]
pub struct FileSystemWorld {
    filename: String,
    contents: String,
    searchstring: String,
    results: Vec<String>
}

#[given(regex=r"(?sm)I have a file called (?P<path>[-\w\d_]+\.txt) And it's contents are (?P<contents>.*)")]
fn setup_minigrep(world: &mut FileSystemWorld, path:String, contents:String) {
    //, path: String, contents: String
    world.filename = path;
    world.contents = contents;
    world.results = Vec::new();
}

#[when(regex=r"I call cargo run -- (?P<search>[^\W]+) (?P<path>[-\w\d_]+\.txt)")]
fn run_minigrep(world: &mut FileSystemWorld,search:String,path:String) {
    world.searchstring = search.clone();

    let contents = world.contents.clone();
    let args = vec![String::from("./minigrep"),search.to_owned(),path.to_owned()];
    let mut display: Vec<String> = Vec::new();

    dbg!(&world);

    minigrep::search(args,&mut |msg:&str| {
            display.push(String::from(msg));
    }, |p| {
        assert_eq!(path.clone(),p,"left is expected, right is actual path passed to reader");
        Result::Ok(contents.clone())
    });

    world.results = display;
}

#[then(regex=r"I receive the response '(?P<expected>[^']+)'")]
fn cat_is_fed(world: &mut FileSystemWorld, expected:String) {
    assert_eq!(expected,world.results.join("\\n"),"left is expected and right is actual");
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