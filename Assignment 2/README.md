# Assignment 2
This is the assignment of that is divided in 3 task.

# Git Comandi Utili
Presupposto che:

1. le chiavi ssh siano configurate con il server (github o bitbuchet)
2. git sia installato e configurato
3. che si disponga di un progetto clonato

i seguenti comandi possono trornare utili per gestire un lavoro collaborativo:

- Controllare se la versione del repository locale sia la stessa di quella presente nel server; se si scarica automaticamente le differenze e le applica al repo locale
```bash
git pull origin master 
``` 
- Segna come "da-committare" tutti le modifiche che hai apportato hai file.
```bash
git add --all
```
- Crea un commit con tutti i cambiamenti apportati con il messaggio *msg*. Scrivere un messaggio esplicativo di quali cambiamenti si ha apportato in quel commit
```bash
git commit -am "msg"
```
- se vengono modificati altri file ripetere il passaggio *2* e *3* per creare un nuovo commit
- pushare i cambiamenti sul server
```bash
git push origin master
```

