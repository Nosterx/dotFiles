import os
import click


def create_folder(folder_path):
    if not os.path.isdir(folder_path):
        os.mkdir(folder_path, 0o700)


def collect_dotfiles(source_dir):
    files = [f for f in os.listdir(source_dir) 
             if f.startswith('.') and not f=='.git']
    return files


def backup_files(files, src_folder, backup_folder):
    for filename in files:
        source_filepath = os.path.join(src_folder, filename)
        if os.path.exists(source_filepath) and not os.path.islink(source_filepath):
            backup_filepath = os.path.join(backup_folder, filename)
            os.rename(source_filepath, backup_filepath)



def symlink_files(files, source_folder, target_folder):
    for filename in files:
        target_filepath = os.path.join(target_folder, filename)
        try:
            os.remove(target_filepath)
        except OSError:
            pass
        source_filepath = os.path.join(source_folder, filename)
        os.symlink(source_filepath, target_filepath)


@click.command()
@click.option('--dst',
              default=os.path.expanduser('~'),
              show_default=True,
              help='Home directory of target user')
@click.option('--src',
              default=os.path.join(os.path.expanduser('~'), 'dotfiles'),
              show_default=True,
              help='DotFiles directory')
@click.option('--backup',
              default=os.path.join(os.path.expanduser('~'), 'dotfiles_backup'),
              show_default=True,
              help='Directory to backup origin dotfiles')
def main(dst, src, backup):
    """ symlink files in src which starts with dot
    and ends with '.conf' extension or with no extension to dst"""
    create_folder(backup)
    dotfiles = collect_dotfiles(src)
    backup_files(dotfiles, dst, backup)
    symlink_files(dotfiles, src, dst)


if __name__ == "__main__":
    main()
