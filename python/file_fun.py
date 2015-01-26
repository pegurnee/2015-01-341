def write_new_file(filename, text_to_write):
  filepath = '/Users/eddie/Documents/git_repos/programming_languages/python/'
  true_filepath = filepath + filename
  file_handle = open(true_filepath, 'w')
  file_handle.write(text_to_write + '\n')
  file_handle.close()
def append_to_file(filename, text_to_write):
  filepath = '/Users/eddie/Documents/git_repos/programming_languages/python/'
  true_filepath = filepath + filename
  file_handle = open(true_filepath, 'a')
  file_handle.write(text_to_write + '\n')
  file_handle.close()
def copyFileWithNewName(old_file, new_file):
  filepath = '/Users/eddie/Documents/git_repos/programming_languages/python/'
  copy_filepath = filepath + old_file
  dest_filepath = filepath + new_file
  file_handle = open(copy_filepath)
  text_to_copy = file_handle.read()
  file_handle.close()
  file_handle = open(dest_filepath, 'w')
  file_handle.write(text_to_copy + '\n')
  file_handle.close()
