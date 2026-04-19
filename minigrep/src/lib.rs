use std::hash::{Hash,Hasher};

pub fn search(
    args:Vec<String>,
    mut display: impl FnMut(&str),
    mut read: impl FnMut(&str) -> std::io::Result<String>) 
{
    let query = &args[1];
    let path= &args[2];
    
    display(format!("Searching for {}",query).as_str());
    display(format!("In file {}",path).as_str());

    match read(path) {
        Ok(contents) => {
            let mut hasher = std::hash::DefaultHasher::new();
            contents.hash(&mut hasher);
            let hash = hasher.finish();

            display(format!("With file contents hash {}",hash).as_str());
        },
        Err(e) => {
            display(format!("Could not read file {}",path).as_str());
        }
    }

    dbg!(args);
}
