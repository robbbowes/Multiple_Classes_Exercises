class BusStop

  attr_reader(:name,:queue)

  def initialize(name, queue)
    @name = name
    @queue = queue
  end

  def queue_count
    @queue.count
  end

  def add_person_to_queue(people)
    for person in people do
      @queue.push(person)
    end
  end

  def remove_person_from_queue(people)
    for person in people do
      @queue.delete(person)
    end
  end

  def clear_queue
    @queue.clear
  end
end
