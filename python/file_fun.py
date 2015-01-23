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
