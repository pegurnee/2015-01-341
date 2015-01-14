def at_len(the_list):
    """
    Takes a list and returns the number
    of atomic elements (basic unit of data)
    of the list
    :param the_list: a list of elements
    :return: the number of atomic elements in the list 
    """
    count = 0
    for each_elem in the_list:
        if isinstance(each_elem, list):
            count += at_len(each_elem)
        else:
            count += 1
    return count
