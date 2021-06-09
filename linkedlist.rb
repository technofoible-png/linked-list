class LinkedList
  attr_accessor :head, :tail

  def initialize ()
    @head = nil
    @tail = nil
  end

  # add a node to end of list
  def append (number)
    # create new node
    this_node = Node.new(number)
    # make head if none
    if head.nil?
      return @head = this_node
    end

    # else, loop to end of list
    current = @head
    until current.next_node.nil?
      current = current.next_node
    end

    # make last node point to new node
    current.next_node = this_node

    # update tail to be this_node
    @tail = this_node
  end

  # add a node to start of list
  def prepend (number)
  # create a new node
  this_node = Node.new(number)
  
  # make new node point to head, and save it to head
  this_node.next_node = head
  @head = this_node
  end

  # returns number of elements in list
  def size
    # return 0 if empty list
    if head.nil?
      return 0
    end
    current = @head
    elements = 1

    until current.next_node.nil?
      # loop thru list to end
      # increment
      elements += 1
      # advance to next node
      current = current.next_node
    end
    puts elements
  end

  # remove last element from list
  def pop
    current = @head

    # loop to second to last element of list
    until current.next_node == tail
      current = current.next_node
    end

    # update tail
    @tail = current

    # set next_node to nil
    current.next_node = nil
  end

  # return true if value is in list
  def contains? (number)
    current = @head

    until current.next_node.nil?
      if current.value == number
        return true
      else
        current = current.next_node
      end
    end
    return false
  end

  # displays list as ( value ) -> ... -> nil
  def to_s
    current = @head
    
    until current.next_node.nil?
      print "( #{current.value} ) -> "
      current = current.next_node
    end
      print "( #{current.value} ) -> nil"
  end

end

class Node 
  # an item in a linked list
  attr_accessor :value, :next_node

  def initialize (value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end

  def contents
    puts "Node value is #{value} and next node is #{next_node}."
  end
end
