fn main() {
    minigrep::search(std::env::args().collect(), |msg| println!("{}",msg));
}

#[cfg(test)]
mod test {
    use super::*;
    use minigrep;

    #[test]
    fn test_search() {
        let args = vec![String::from("./minigrep"),String::from("sample"),String::from("file.txt")];
        let mut msgs:Vec<String> = vec![];

        minigrep::search(args,&mut |msg:&str| {
            msgs.push(String::from(msg));
        });

        assert_eq!(2,msgs.len(),"2 messages should be displayed");
    }
}