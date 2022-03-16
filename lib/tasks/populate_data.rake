namespace :populate_data do
  desc "Populate Serials Data"
  task :serials => :environment do
    ImportSerialsDataService.new(file: ENV['SERIALS_DATA_FILE']).perform
  end

  desc "Populate Actors Data"
  task :reviews => :environment do
    ImportReviewsDataService.new(file: ENV['REVIEWS_DATA_FILE']).perform
  end
end
