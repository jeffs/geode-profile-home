from pprint import pprint as pp

def ls(*args):
    from os import listdir
    return [f for a in args for f in listdir(a)] if args else listdir('.')
