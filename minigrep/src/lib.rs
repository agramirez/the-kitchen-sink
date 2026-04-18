pub fn search(args:Vec<String>,mut display: impl FnMut(&str))
{
    let query = &args[1];
    let path= &args[2];
    
    display(format!("Searching for {}",query).as_str());
    display(format!("In file {}",path).as_str());

    dbg!(args);
}