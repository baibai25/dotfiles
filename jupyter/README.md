# Note
## Jupyter Notebook settings
+ ~/.jupyter/custom/custom.css
+ [printing error](https://github.com/dunovank/jupyter-themes/issues/273)

## Themes
+ [jupyter-themes](https://github.com/dunovank/jupyter-themes)
+ jt -t chesterish -T -N -fs 14 -vim -cellw 90%

## Env

```
conda create -n NAME Anaconda
conda activate NAME
pip install jupyterlab-code-formatter isort yapf
jupyter lab
```

jupyter json settings

```
"yapf": {
    "style_config": "{based_on_style: google, indent_width: 2}"
}
```
