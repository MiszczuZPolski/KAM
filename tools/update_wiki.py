import os
import sys
import traceback
import subprocess as sp
from github import Github

CLASSNAMEBODY = """**Classnames listed here are extracted automatically from CfgWeapons and CfgMagazines, so some might be missing**

{}
"""

REPOUSER = "MiszczuZPolski"
REPONAME = "KAM"
REPOPATH = "{}/{}".format(REPOUSER,REPONAME)

def update_wiki(repo):
    diag = sp.check_output(["python3", "tools/search_classes.py", "--markdown"])
    diag = str(diag, "utf-8")
    wiki_page = repo.get_wiki_page("Classnames")
    wiki_page.edit(body=CLASSNAMEBODY.format(diag))

def main():
    print("Obtaining token ...")
    try:
        token = os.environ["GH_TOKEN"]
        repo = Github(token).get_repo(REPOPATH)
    except:
        print("Could not obtain token.")
        print(traceback.format_exc())
        return 1
    else:
        print("Token successfully obtained.")

    print("\nUpdating classname wiki ...")
    try:
        update_wiki(repo)
    except:
        print("Failed to update classname wiki page.")
        print(traceback.format_exc())
        return 1
    else:
        print("Classname wiki page successfully updated.")

    return 0

if __name__ == "__main__":
    sys.exit(main())
