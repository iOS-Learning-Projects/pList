//
//  main.m
//  pList
//
//  Created by Eduardo Vital Alencar Cunha on 29/03/17.
//  Copyright © 2017 Vital. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // itens do meu array para gerar a pList
        NSMutableArray *lists = [[NSMutableArray alloc] init];

        // Criando o primeiro item da pList
        NSMutableDictionary *item0 = [[NSMutableDictionary alloc] init];
        [item0 setObject:@"MAL" forKey:@"abreviacao"];
        [item0 setObject:@"Maurício Júnior" forKey:@"nome"];
        [item0 setObject:@"25" forKey:@"idade"];

        // Adcionando o primeiro item na pList
        [lists addObject:item0];

        // Criando o segundo item da pList
        NSMutableDictionary *item1 = [[NSMutableDictionary alloc] init];
        [item1 setObject:@"MIC" forKey:@"abreviacao"];
        [item1 setObject:@"Michel" forKey:@"nome"];
        [item1 setObject:@"29" forKey:@"idade"];

        // Adcionando o segundo item na pList
        [lists addObject:item1];

        // Escrevendo pList
        BOOL arquivoFoiGravadoComSucesso = [lists writeToFile:@"/tmp/plist.plist" atomically:YES];

        if (arquivoFoiGravadoComSucesso) {
            NSLog(@"Arquivo gravado com sucesso");
        } else {
            NSLog(@"Falha ao grava arquivo");
        }

        // Recuperando pList
        NSMutableArray *meupList = [NSMutableArray arrayWithContentsOfFile:@"/tmp/plist.plist"];

        for (NSDictionary *item in meupList) {
            NSLog(@"%@", item[@"nome"]);
        }
    }
    return 0;
}
