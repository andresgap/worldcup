namespace :quiniela do

    desc 'Cleans database'
    task :clean => :environment do |t, args|

        Invitation.destroy_all
        Tournament.destroy_all
        Leaderboard.destroy_all
        Match.destroy_all
        Phase.destroy_all
        PredictionSet.destroy_all
        Prediction.destroy_all
        Team.destroy_all
        Tournament.destroy_all
        User.destroy_all
    end
end
