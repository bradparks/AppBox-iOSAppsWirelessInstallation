//
//  AccountPreferencesViewController.m
//  AppBox
//
//  Created by Vineet Choudhary on 28/03/17.
//  Copyright © 2017 Developer Insider. All rights reserved.
//

#import "AccountPreferencesViewController.h"

@interface AccountPreferencesViewController ()

@end

@implementation AccountPreferencesViewController{
    NSArray *itcAccounts;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadAccounts];
}

-(void)loadAccounts{
    itcAccounts = [SAMKeychain accountsForService:abiTunesConnectService];
}

#pragma mark - AccountPreferencesViewController Delegate
-(NSInteger)numberOfRowsInTableView:(NSTableView *)tableView{
    return itcAccounts.count;
}

-(NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row{
    AccountCellView *cell = [tableView makeViewWithIdentifier:@"AccountCell" owner:self];
    NSDictionary *keyChainAccount = [NSDictionary dictionaryWithDictionary:[itcAccounts objectAtIndex:row]];
    [cell.accountIdLabel setStringValue:[keyChainAccount valueForKey:kSAMKeychainAccountKey]];
    [cell.accountDescLabel setStringValue:[keyChainAccount valueForKey:kSAMKeychainLabelKey]];
    return cell;
}

-(BOOL)tableView:(NSTableView *)tableView shouldSelectRow:(NSInteger)row{
    NSDictionary *keyChainAccount = [NSDictionary dictionaryWithDictionary:[itcAccounts objectAtIndex:row]];
    [accountNameLabel setStringValue:[keyChainAccount valueForKey:kSAMKeychainLabelKey]];
    [accountIdLabel setStringValue:[keyChainAccount valueForKey:kSAMKeychainAccountKey]];
    [accountDescLabel setStringValue:[keyChainAccount valueForKey:kSAMKeychainAccountKey]];
    return YES;
}

#pragma mark - Actions
- (IBAction)addAccountButtonTapped:(NSButton *)sender {
    SelectAccountViewController *selectAccountViewController = [[SelectAccountViewController alloc] initWithNibName:NSStringFromClass([SelectAccountViewController class]) bundle:nil];
    selectAccountViewController.delegate = self;
    [self presentViewControllerAsSheet:selectAccountViewController];
}

- (IBAction)deleteAccountButtonTapped:(NSButton *)sender {
    
}

#pragma mark - SelectAccountViewController Delegate
-(void)selectedAccountType:(AccountType)accountType{
    NSStoryboard *storyBoard = [NSStoryboard storyboardWithName:@"Main" bundle:nil];
    switch (accountType) {
        case AccountTypeDropBox: {
            DropboxViewController *dropboxViewController = [storyBoard instantiateControllerWithIdentifier:NSStringFromClass([DropboxViewController class])];
            [self presentViewControllerAsSheet:dropboxViewController];
        }break;
            
        case AccountTypeITC: {
            ITCLoginViewController *itcLoginViewController = [storyBoard instantiateControllerWithIdentifier:NSStringFromClass([ITCLoginViewController class])];
            itcLoginViewController.delegate = self;
            [self presentViewControllerAsSheet:itcLoginViewController];
        }break;
    }
}

#pragma mark - ITCLoginViewController Delegate
-(void)itcLoginCanceled{
    
}

-(void)itcLoginResult:(BOOL)success{
    if (success) {
        [self loadAccounts];
        [accountTableView reloadData];
    }
}

@end
