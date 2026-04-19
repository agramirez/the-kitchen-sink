fn main() {
    minigrep::search(std::env::args().collect(), |msg| println!("{}",msg),|path| std::fs::read_to_string(path));
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
        },|path| Ok(String::from("")));

        // [note 2026-04-19]: we only check the total number of messages we expect
        // since the actual messages are checked in the feature tests
        assert_eq!(3,msgs.len(),"3 messages should be displayed");
    }
}