fn main() {
    search(std::env::args().collect(), |msg| println!("{}",msg));
}

fn search(args:Vec<String>,mut display: impl FnMut(&str))
{
    let query = &args[1];
    let path= &args[2];
    
    display(format!("searching for {}",query).as_str());
    display(format!("in file {}",path).as_str());

    dbg!(args);
}

#[cfg(test)]
mod test {
    use super::*;

    #[test]
    fn test_search() {
        let args = vec![String::from("./minigrep"),String::from("sample"),String::from("file.txt")];
        let mut msgs:Vec<String> = vec![];

        search(args,&mut |msg:&str| {
            msgs.push(String::from(msg));
        });

        assert_eq!(2,msgs.len(),"2 messages should be displayed");
    }
}