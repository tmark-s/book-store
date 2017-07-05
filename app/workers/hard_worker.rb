class HardWorker
  include Sidekiq::Worker

  def perform(word)
    puts word
  end
end
