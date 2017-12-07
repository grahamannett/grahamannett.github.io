
# useless sites i started and had something on at one point 
_note: none of these are actually my sites anymore, were free domains i previously had used_

- [birdflu.ml](http://birdflu.ml/)
- [practice.gq](http://practice.gq/)
- [thespot.ml](http://thespot.ml/)

---
<br>

# trivial python notes

_I have no idea how relevant these are anymore_

## installing xgboost on python3

xgboost doesn't install through pip for python3 by default.  i always seem to forget this, and have no interest in using graphlab create properties (and a lot of kaggle scripts are written explicitly with xgboost in mind) and i try to keep it isolated to virtualenv's so i sometimes forget what the process is

the best way to install is create virtualenv and project folder:
```sh
git clone --recursive https://github.com/dmlc/xgboost
cd xgboost
bash build.sh
cd python-package
pip3 install -e .
```

#### using pandas to change object feature columns to numerical category columns
useful for multiple reasons (i.e. save visual space when viewing, lots of category data is indecipherable, MOSTLY for using sklearn features and not having to dummy variables which can get extremely computationally expensive)

[another reason why cat is better than object dtypes for pandas](http://matthewrocklin.com/blog/work/2015/03/16/Fast-Serialization/)

```python
import pandas as pd

df = pd.read_csv() # or whatever
for x in df.dtypes[df.dtypes == 'object'].index:
    df[x] = (df[x].astype('category')).cat.codes
```

---
<br>
## go guide

All of this was useless/outdated when (wrote in 2014 or something, its almost 2018 now), so just deleted