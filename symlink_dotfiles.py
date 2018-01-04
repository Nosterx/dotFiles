import os
import click


def create_folder(folder_path):
    if not os.path.isdir(folder_path):
        os.mkdir(folder_path, 0700)


def collect_dotfiles(source_dir):
    files = [f for f in os.listdir(source_dir)
                 if f.startswith('.') 
                   and os.path.isfile(os.path.join(source_dir, f))
                   and (os.path.splitext(f)[-1] in ('', '.conf'))]
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
              default=os.environ['HOME'],
              help='Target user home directory')
@click.option('--src',
              default=os.path.join(os.environ['HOME'], 'dotfiles'),
              help='DotFiles directory')
@click.option('--backup',
              default=os.path.join(os.environ['HOME'], 'dotfiles_backup'),
              help='Target user home directory')
def main(dst, src, backup):
    """ symlink files in src which starts with dot
    and ends with '.conf' extension or with no extension to dst"""
    create_folder(backup)
    dotfiles = collect_dotfiles(src)
    backup_files(dotfiles, dst, backup)
    symlink_files(dotfiles, src, dst)


if __name__ == "__main__":
    main()
