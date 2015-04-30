Make a `.ropeproject` folder in every package you will be working with and copy the config.py file into it:

```bash
$ cd sites/
$ for pkg in $(ls); do mkdir -p $pkg/.ropeproject/ && cp ~/.vim/esv/config.py $pkg/.ropeproject/; done
```

Run the `generate_tags.sh` script periodically (I run on system startup) to keep your python tags up to date.
