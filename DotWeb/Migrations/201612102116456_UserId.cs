namespace DotWeb.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class UserId : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.UserGroups", "GroupId", c => c.Int(nullable: false, identity: true));
            AddColumn("dbo.Users", "UserId", c => c.Int(nullable: false, identity: true));
        }
        
        public override void Down()
        {
            DropColumn("dbo.Users", "UserId");
            DropColumn("dbo.UserGroups", "GroupId");
        }
    }
}
