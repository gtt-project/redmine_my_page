module MyPagePatches
  module UserPreferencePatch

    def self.included(base) # :nodoc:
      base.send(:include, InstanceMethods)

      base.class_eval do
        safe_attributes 'landing_page', 'my_activity', 'my_cust_query', 'my_project'
      end
    end

    module InstanceMethods
      def landing_page; self[:landing_page] end
      def landing_page=(value); self[:landing_page]=value end

      def my_project; self[:my_project] end
      def my_project=(value); self[:my_project]=value end

      def my_activity
        if self[:my_activity].nil?
          self[:my_activity] = Hash.new
          self[:my_activity][:query_ids]= []
          self[:my_activity][:limit]= 10
          save
        end
        self[:my_activity]
      end

      def my_activity=(value); self[:my_activity]=value end

      def my_cust_query
        if self[:my_cust_query].nil?
          self[:my_cust_query] = Hash.new
          self[:my_cust_query][:query_ids]= []
          save
        end
        self[:my_cust_query]
      end

      def my_cust_query=(value); self[:my_cust_query]=value end
    end
  end
end
