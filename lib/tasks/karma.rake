
namespace :karma do

  desc "Update karama for all users"
  task :update_for_all_users => :environment do
    User.all.each do |user|
      user.update_attribute(:karma_sum, user.find_karma_sum)
    end
  end
end



# puts Benchmark.measure { User.limit(100).each { |user| user.update_attributes(karma_sum: user.karma_points.sum(:value)) }}
